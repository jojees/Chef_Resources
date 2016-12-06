require 'chefspec'  
require 'chefspec/berkshelf' 
require_relative '../../libraries/helper' 

at_exit { ChefSpec::Coverage.report!  }   

