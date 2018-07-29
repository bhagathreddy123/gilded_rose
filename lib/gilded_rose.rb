AGED_BRIBE = 'Aged Bribe'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'
CONJURE = 'Conjured Item'

class ItemUpdater
  attr_reader :item, :quality_data

  def initialize(item, quality_data)
    @item = item
    @quality_data = quality_data
  end

  def update
    item.sell_in -= 1
    item_update_quantity
    item_update_quantity if expired?(item)
  end

  def expired?
    item.sell_in < 0
  end
  
  def item_update_quantity
    if item.quality < 50 && item.quality_data > 0
      item.quality += quality_data
    end
  end
end

class BackstageUpdater < ItemUpdater
  def quality_data
   if expired?(item)
      -item.quality
    elsif item.sell_in < 5
      3
    elsif item.sell_in < 10
      2
    else
      @quality_data
    end
  end
end

def update_quality(items)
  items.each do |item|
    case item.name
    when BACKSTAGE_PASS
      BackstageUpdater.new(item, 1).update
    when AGED_BRIBE
     ItemUpdater.new(item, 1).update
    when SULFURAS

    when CONJURE
      ItemUpdater.new(item, -2).update
    else
      ItemUpdater.new(item, -1).update
    end
  end
end



######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
