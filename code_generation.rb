require 'csv'
module Model
  
  def Model.load_from_file(file)
    #extract class name
    #classes must be Constant-named (capitalize)
    class_name = strip_file_name(file).capitalize!
    #create a csv-model for the class w. headers
    model = CSV.read(file, {headers: true})
    
    #generate class skeleton
    gen_class = generate_class_from_csv(model)
    
    #name class (have to use Kernel to mix class into global namespace)
    #i.e. escape our Module
    Kernel.const_set(class_name, gen_class)

    generate_object_array(model, class_name)    
  end

  def Model.generate_object_array(csv, class_name)
    #requires a CSV-object with headers
    #(or with headers stripped)
    instances = []
    csv.each { |row|
      obj = const_get(class_name).new(*row)
      instances.push(obj)
    }
    instances
  end
  
  #requires CSV with headers
  def Model.generate_class_from_csv(csv)
    attrs = csv.headers

    Class.new do
      #we have to splat the array
      #so we can chuck it in attr_accessor
      #thank you random StackOverflow person
      #who explained splat
      attr_accessor *attrs 
      
      define_method :initialize do |*args|
        attrs.each_with_index { |attr, i|
          #memo: a class is an instance too!
          self.instance_variable_set("@"+attr, args[i]) 
        }
      end
    end
  end
                   
  
  def Model.strip_file_name(file)
    #removes all extensions and path info
    File.basename(file, ".*")
  end
  
  
end
