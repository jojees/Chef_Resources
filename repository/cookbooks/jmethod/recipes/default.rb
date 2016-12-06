bash 'Executing shell script since hostname ends with even number!!!!' do
  cwd '/tmp'
  code <<-EOH
    echo "Hostname ends with a even number!!!!!!!"
  EOH
  only_if { iseven? } 
end  

bash 'Executing shell script since hostname ends with odd number!!!!' do 
  cwd '/tmp'  
  code <<-EOH    
    echo "Hostname ends with a odd number!!!!!!!"
  EOH
  only_if { isodd? }   
end  

file "/tmp/myfile.txt" do
  content 'saome data'
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end
