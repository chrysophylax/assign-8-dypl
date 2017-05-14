class Array
  
  def select_first(options={} )
    attr = options.keys[0]
    value = options.values[0]
    if value.class == Array
      #do array stuff
      f = self.detect { |e| value.include?(e.send(attr)) }
    else
      #do single stuff
      f = self.detect{ |e| e.send(attr) == value }
    end
  end

  
end
