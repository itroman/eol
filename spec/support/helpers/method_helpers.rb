 module Attribute_Helper
     
 def attribute_list
 @attributes = subject.instance_variables.map {|attr| attr.to_s.gsub('@', '').to_sym } 
 end
 
 end