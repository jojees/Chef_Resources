module EvenOddHostname
 module Helper
  def iseven?
    even_hostname_series = [ node['hostname'].split('.')[0].split('-').reverse[0] ].map! {|x| x[/\d+$/]} 
    ((even_hostname_series[0].to_i.even?) && (!even_hostname_series[0].nil?)) ? true : false 
  end   

  def isodd?
    odd_hostname_series = [ node['hostname'].split('.')[0].split('-').reverse[0] ].map! {|x| x[/\d+$/]}
    return true if odd_hostname_series[0].to_i.odd? 
  end 
 end  
end
Chef::Resource.send(:include, EvenOddHostname::Helper) 
