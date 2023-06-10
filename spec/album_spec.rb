require_relative '../classes/album'

describe MusicAlbum do
  new_album = MusicAlbum.new('on_spotify', 'genre', 'author', 'label', '2016-05-04', 'source')

  it 'Should expect the album to be able to be archived' do
    expect(new_album.can_be_archived?).to eq(false)
  end
end
