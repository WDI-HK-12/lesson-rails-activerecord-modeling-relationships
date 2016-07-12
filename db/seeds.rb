10.times do
  manager_info = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    office_number: Faker::PhoneNumber.phone_number.gsub('.', ''),
    cell_phone_number: Faker::PhoneNumber.phone_number.gsub('.', '')
  }
  manager = Manager.create(manager_info)

  2.times do
    artist_info = {
      name: Faker::Name.name,
      photo_url: Faker::Avatar.image,
      nationality: Faker::Address.country,
      home_address: Faker::Address.street_address,
    }
    artist = manager.artists.create(artist_info)

    2.times do
      genre  = Genre.find_or_create_by(name: Faker::Book.genre)
      album_info = {
        title: Faker::Book.title,
        year: Faker::Date.between(10.year.ago, Date.today).year,
        genre_id: genre.id
      }
      album = artist.albums.create(album_info)

      5.times do
        song_info = {
          title: Faker::Book.title,
          duration: rand(60..420),
          album_title: album.title,
          artist_last_name: artist.name
        }

        album.songs.create(song_info)
      end
    end
  end
end

