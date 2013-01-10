module ApplicationHelper

	def icon_link_to str,path,icon,*args
		str = content_tag(:span,str + " ") + content_tag(:span,nil,class: "icon-#{icon}")
		content_tag(:ul,
			content_tag(:li,
				link_to(str,path,args[0]),
				class:"active"),
			class:"nav nav-pills")
	end

end
