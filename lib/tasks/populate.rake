namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    [User, Item, Conversation, Like, Match, Message].each(&:delete_all)
    @populateitems = [["Grandma's Ugly Shirt", "http://image.dhgate.com/0x0/f2/albu/g1/M01/BD/27/rBVaGFZAM4SAESy9AAiZRHYIG5U939.jpg"],["Laptop","https://laptopninja.io/wp-content/uploads/2015/04/MSI-CX61-2PC-499US.jpg"],["Hockey Skates","http://i111.photobucket.com/albums/n125/jeffw13/VaporXXV.jpg"],["PS4","http://static1.gamespot.com/uploads/original/1538/15382745/2644217-7862471310-ps4.j.jpg"],["Coffee Maker","http://pollards.com/wp-content/uploads/2014/01/Espresso9-1-Group-Coffee-Machine.jpg"],["Pokemon Cards","https://s-media-cache-ak0.pinimg.com/236x/74/05/35/7405358e16e4df38b7ea629a5741820e.jpg"],["Fixie Bike","http://www.fullhouse-world.de/mediapool/41/417545/images/Rossin_Fixie-3.JPG"],["Record Player","http://img15.deviantart.net/7a20/i/2012/047/d/2/record_player__by_argne-d4pwubv.jpg"],["Office Chair","http://gearpatrol.com/wp-content/uploads/2015/09/FreedomTaskChair-650x500-Gear-Patrol.jpg"]]
      i = 0
      User.populate 10 do |user|
        user.name = Faker::Name.name
        user.longitude = Faker::Address.longitude
        user.latitude = Faker::Address.latitude
        userid = user.id

        Item.populate 1 do |item|
          #item.name = Faker::Commerce.product_name
          item.user_id = userid
          item.name = @populateitems[i][0]
          #samps = Urss.at("https://api.flickr.com/services/feeds/photos_public.gne?tags="+tag1+","+tag2+"&format=rss_200")
          # samps = Urss.at("http://www.degraeve.com/flickr-rss/rss.php?tags=cars%2C+bikes%2C&tagmode=all&sort=relevance&num=25")
          # sam = samps.entries.map{ |entry| entry.medias.collect(&:content_url) }.flatten
          # item.url = sam.shuffle.sample
          item.url = @populateitems[i][1]
          item.description = "I am looking for something to trade in exchange for my" + item.name
          i = i + 1;
        end
      end
      @lastone = User.last.id
      [1,2,3].each do |i|
        Match.populate 8 do |match|
          match.item_offered_id = User.last.id + i
          match.item_liked_id = Faker::Number.between(1, 8)
          match.user_offered_id = match.item_offered_id
          match.user_liked_id = match.item_liked_id
        end
        # [User, Item, Conversation, Like, Match, Message].each(&:delete_all)
        # User.populate 20 do |user|
        #   user.name = Faker::Name.name
        #   user.longitude = Faker::Address.longitude
        #   user.latitude = Faker::Address.latitude
        #   userid = user.id
        #   Item.populate 1 do |item|
        #     item.name = Faker::Commerce.product_name
        #     item.user_id = userid
        #     #samps = Urss.at("https://api.flickr.com/services/feeds/photos_public.gne?tags="+tag1+","+tag2+"&format=rss_200")
        #     samps = Urss.at("http://www.degraeve.com/flickr-rss/rss.php?tags=cars%2C+bikes%2C&tagmode=all&sort=relevance&num=25")
        #     sam = samps.entries.map{ |entry| entry.medias.collect(&:content_url) }.flatten
        #     item.url = sam.shuffle.sample
        #   end
        # end
        # @lastone = User.last.id
        # [1,2,3].each do |i|
        #   Match.populate 30 do |match|
        #     match.item_offered_id = User.last.id + i
        #     match.item_liked_id = Faker::Number.between(1, 20)
        #     match.user_offered_id = match.item_offered_id
        #     match.user_liked_id = match.item_liked_id
        #   end
        # end
        # Item.populate 20 do |item|
        #   item.name = Faker::Commerce.product_name
        #   item.user_id = 1
        #   #samps = Urss.at("https://api.flickr.com/services/feeds/photos_public.gne?tags="+tag1+","+tag2+"&format=rss_200")
        #   samps = Urss.at("http://www.degraeve.com/flickr-rss/rss.php?tags=cars%2C+bikes%2C&tagmode=all&sort=relevance&num=25")
        #   sam = samps.entries.map{ |entry| entry.medias.collect(&:content_url) }.flatten
        #   item.url = sam.shuffle.sample
        # end

      end
  end
end
