package com.codingdojo.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.services.SongService;



@Controller
public class SongController {
	private final SongService songService;

	public SongController(SongService songService){
	        this.songService = songService;
	    }

	@RequestMapping("/dashboard")
	 public String index(Model model, @ModelAttribute("song") Song song) {
        List<Song> songs = songService.allSongs();
        model.addAttribute("songs", songs);
        return "/songs/index.jsp";
    }
	
	@RequestMapping("/search")
	 public String index(Model model, @RequestParam(value="artist") String artist) {
       List<Song> songs = songService.searchSongsByArtist(artist);
       model.addAttribute("search", artist);
       model.addAttribute("songs", songs);
       return "/songs/search.jsp";
   }
	
	
	@RequestMapping("/songs/top")
	 public String songsTop(Model model) {
      List<Song> songs = songService.searchTopSongs();
      model.addAttribute("songs", songs);
      return "/songs/top.jsp";
  }
	
	

	@RequestMapping(value = "/songs", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			return "/songs/new.jsp";
		}
		
		songService.createSong(song);
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/songs/new")
	 public String newSong(@ModelAttribute("song") Song song) {
       return "/songs/new.jsp";
   }

	@RequestMapping("/songs/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "show.jsp";
	}
	
	@GetMapping("/songs/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "/songs/edit.jsp";	
	}

	@PutMapping("/songs/{id}")
	public String update(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "/songs/edit.jsp";
		} else {
			songService.updateSong(song);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/songs/{id}")
    public String destroy(@PathVariable("id") Long id) {
		songService.deleteSong(id);
        return "redirect:/dashboard";
    }
}
