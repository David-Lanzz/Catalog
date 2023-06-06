require './classes/album'

describe MusicAlbum do
  album = MusicAlbum.new

  it 'Should expect the album to be able to be archived' do
    expect(album.can_be_archived?).to eq(true)
  end
end
