# frozen_string_literal: true

require 'combine_pdf'

module CombinePdfFiles
  module Wizard
    class << self
      def glue_now(files_root_path, new_filename:)
        glued          = CombinePDF.new
        glued_filename = "#{files_root_path}/#{new_filename}.pdf"

        File.delete(glued_filename) if File.exist?(glued_filename)

        Dir.foreach(files_root_path) do |filename|
          next if File.directory?(filename) || not_pdf?(filename)

          begin
            glued << CombinePDF.load(compress(files_root_path, filename))

          rescue StandardError => err
            puts "[ERROR] page #{page_path} could not be loaded: #{err.message}"
          end
        end

        glued.save(glued_filename)
      end

      private

      def not_pdf?(filename)
        !filename.include?(".pdf")
      end

      def compress(file_path, filename)
        original_filename   = "#{file_path}/#{filename}"
        compressed_filename = "#{file_path}/compressed-#{filename}"

        compression_command = "qpdf --recompress-flate --compression-level=9 --object-streams=generate #{original_filename} #{compressed_filename}"

        system(compression_command)

        File.delete(original_filename)

        File.rename(compressed_filename, original_filename)

        original_filename
      end
    end
  end
end

if ARGV.empty?
  puts "it is missing the required parameters!\n\n"
  puts "usage: ruby wizard.rb files_root_path new_filename\n\n"
  puts "example:"
  puts "ruby wizard.rb 'Desktop/personal/my_pdf_pages' 'my_combined_pdf'\n\n"
  puts "now, your time:"
  exit
end

files_root_path = ARGV[0]
new_filename    = ARGV[1]

CombinePdfFiles::Wizard.glue_now(files_root_path, new_filename: new_filename)
