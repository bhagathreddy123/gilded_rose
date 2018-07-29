AGED_BRIBE = 'Aged Bribe'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|

    if item.name != SULFURAS
      item.sell_in -= 1
    end

    case item.name
    when BACKSTAGE_PASS
      item_update_quantity(item, 1)
        if item.sell_in < 10
          item_update_quantity(item, 1)
        end
        if item.sell_in < 5
          item_update_quantity(item, 1)
        end
        item_update_quantity(item, -item.quality) if expired?(item)
    when AGED_BRIBE
      item_update_quantity(item, 1)
       item_update_quantity(item, 1) if expired?(item)
    when SULFURAS

    else
      item_update_quantity(item, -1)
      item_update_quantity(item, -1) if expired?(item)
    end

    
    if expired?(item)
      if item.name == AGED_BRIBE
      
      elsif item.name == BACKSTAGE_PASS
      elsif item.name = SULFURAS

      else
           
      end
    end
  end
end

def expired?(item)
  item.sell_in < 0
end

def item_update_quantity(item,  quality_data)
  if item.quality < 50 && item.quality_data > 0
    item.quality += quality_data
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
