User.destroy_all
u1 = User.new(:username => "Vinay Badoni", password: "123456", :email => "vinaycs01@gmail.com", :isAdmin=>true)
u1.save(:validate => false)
u2 = User.new(:username => "Jony Malhotra",password: "test123456", :email => "jony@idifysolutions.com", :isAdmin=>true )
u2.save(:validate => false)
u3 = User.new(:username => "Gagan Sharma" ,password: "test123456",:email => "gagan@idifysolutions.com", :isAdmin=>true )
u3.save(:validate => false)



