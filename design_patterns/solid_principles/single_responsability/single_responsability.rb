# NOTE: each class should have only one proposal, and nothing more
#       if a class need to have another responsability/proposal,
#       then it should be another class.
#       
#       "if acts like a duck, and quack like a duck, so it's a duck"
#       
#       so here we have a journal and page classes,
#       and we want to format it in a several ways
#       
#       Instead of creating a class called XFormater with all
#       the formater types there as methods,
#       we have a FormaterManager class
#       that received a type (another class) and call
#       the formater method from it.
#      
#       So if we need to have more formater types,
#       it's just needed to create the new class inheriting from
#       Formater::Types::Base
#       and configure it as the 'type' of a formater_manager
# 
#       eg: formater_manager.type = Formater::Types::HtmlType
# 
require "./page"
require "./journal"
require "./formater/manager"
require "./formater/types/json_type"
require "./formater/types/html_type"
require "./formater/types/yaml_type"
require "./formater/types/xml_type"

page_one = Page.new title: "Title one", body: "ma body", paragraphes: 5
page_two = Page.new title: "Title two", body: "ma body two", paragraphes: 3

journal = Journal.new pages: [page_one, page_two]

formater_manager = Formater::Manager.new(
  type: Formater::Types::JsonType,
  data: journal
)

begin

  formater_manager.format_data

  formater_manager.type = Formater::Types::HtmlType
  formater_manager.format_data

  # formater_manager.data = nil # NOTE: it raises an error

  formater_manager.type = Formater::Types::YamlType
  formater_manager.format_data

  formater_manager.type = Formater::Types::XmlType

  formater_manager.format_data

  page_three = Page.new title: "Title three", body: "yo body three", paragraphes: 3

  journal.add_page page_three

  formater_manager.format_data

  journal.remove_page page_one

  formater_manager.format_data

rescue Formater::InvalidDataError => err
  puts "ERROR! #{err.message}"
end
