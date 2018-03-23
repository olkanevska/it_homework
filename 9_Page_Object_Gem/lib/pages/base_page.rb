class BasePage
 include PageObject

 link(:login, class: 'login' )
 link(:logout, class:'logout')
 button(:submit_form , name:'commit')
 div(:expected_message, id:'flash_notice')
end