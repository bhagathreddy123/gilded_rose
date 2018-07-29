AGED_BRIBE = 'Aged Bribe'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
    if item.name != AGED_BRIBE && item.name != BACKSTAGE_PASS
      if item.quality > 0
        if item.name != ''
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == BACKSTAGE_PASS
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end

    if item.name != SULFURAS
      item.sell_in -= 1
    end

    if item.sell_in < 0
      if item.name == AGED_BRIBE
        item_increment_quantity(item)
      elsif item.name == BACKSTAGE_PASS
        item_decrement_quantity(item, item.quality)
      elsif item.name = SULFURAS

      else
        item_decrement_quantity(item, 1)
        
      end
    end
  end
end

def item_increment_quantity(item)
  if item.quality < 50
     item.quality += 1
  end
end

def item_decrement_quantity(item, quantity_data)
  if item.quality > 0
      item.quality -= 1
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
