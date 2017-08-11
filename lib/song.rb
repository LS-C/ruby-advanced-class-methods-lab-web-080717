require 'pry'


class Song

    attr_accessor :name, :artist_name

    @@song = []

    def self.create
        self.all << song = Song.new
        song
    end

    def self.all
        @@song
    end

    def self.new_by_name(name)
        song = self.new
        song.name = name
        song
    end

    def self.create_by_name(name)
        song = self.new
        song.name = name
        self.all << song
        song
    end

    def self.find_by_name(name)
        self.all.detect { |song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.create_by_name(name)
        self.find_by_name(name)
    end

    def self.alphabetical
        self.all.sort_by! { |s| s.name }
    end

    def self.new_from_filename(filename)
        song = self.new
        song.name = filename.split(" - ").last.split(".").first
        song.artist_name = filename.split(" - ").first
        self.all << song
        song
    end

    def self.create_from_filename(filename)
        song = self.new
        song.name = filename.split(" - ").last.split(".").first
        song.artist_name = filename.split(" - ").first
        self.all << song
        song
    end

    def self.destroy_all
        @@song.clear
    end



end

