package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepository;

    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }
    // devuelve todos los libros
    public List<Song> allSongs() {
        return songRepository.findAll();
    }
    // crea un libro
    public Song createSong(Song b) {
        return songRepository.save(b);
    }
    //actualiza un libro
    public Song updateSong(Song b) {
        return songRepository.save(b);
    }
    // recupera un libro
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
    
    public void deleteSong(Long id) {
    	songRepository.deleteById(id);
    }
    
    public List<Song> searchSongsByArtist(String artist) {
        return songRepository.findByArtistContaining(artist);
    }
    
    public List<Song> searchTopSongs() {
    	//Sort sort = Sort.by("rating").descending();
        return songRepository.findTop10ByOrderByRatingDesc();
    }
}
