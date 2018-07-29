AGED_BRIBE = 'Aged Bribe'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
    if item.name != 'Aged Brie' && item.name != 'BACKSTAGE_PASS'
      if item.quality > 0
        if item.name != ''
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == 'BACKSTAGE_PASS'
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
    if item.name != 'SULFURAS'
      item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != "AGED_BRIBE"
        if item.name != 'BACKSTAGE_PASS'
          if item.quality > 0
            if item.name != 'SULFURAS'
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
