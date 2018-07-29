AGED_BRIBE = 'Aged Bribe'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
    if item.name != AGED_BRIBE && item.name != BACKSTAGE_PASS
      if item.quality > 0
        if item.name != SULFURAS
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == BACKSTAGE_PASS
          if item.sell_in < 11
            item_update_quantity(item, 1)
          end
          if item.sell_in < 6
           item_update_quantity(item, 1)
          end
        end
      end
    end

    if item.name != SULFURAS
      item.sell_in -= 1
    end

    if item.sell_in < 0
      if item.name == AGED_BRIBE
        item_update_quantity(item, 1)
      elsif item.name == BACKSTAGE_PASS
        item_update_quantity(item, -item.quality)
      elsif item.name = SULFURAS

      else
        item_update_quantity(item, -1)        
      end
    end
  end
end

def item_update_quantity(item,  quality_data)
  if item.quality < 50 && item.quality_data > 0
    item.quality += quality_data
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
