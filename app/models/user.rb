
class User < ActiveRecord::Base

	has_secure_password
	
	validates :user_name,uniqueness:true,presence:true,length:{within: 4..15}
	validates :password,presence:true
    
   def self.get_user(options ={})
   	user = User.find_by_user_name(options[:user_name])
   	
   	if user && user.authenticate(options[:password])
      true
    end     

   end
   
   private
  
end