# # require modules here
require "pry"

require "yaml"  
hash = YAML.load_file('./lib/emoticons.yml')  

def load_library(hash)
    emoticons_hash = {"get_meaning"=> {}, "get_emoticon"=> {}}
    japanese_emoticons = []
    english_emoticons = []
    meanings = []
      act = YAML.load_file('./lib/emoticons.yml')
        act.each do |x, y| #y[0] = american, y[1] = japanese
          japanese_emoticons << y[1]
          english_emoticons << y[0] 
          meanings << x 
        end 
    emoticons_hash["get_meaning"] = japanese_emoticons.zip(meanings).to_h
    emoticons_hash["get_emoticon"] = english_emoticons.zip(japanese_emoticons).to_h
  emoticons_hash
end 


def get_japanese_emoticon(hash, emoticon)
    answer = ""
    hashes = load_library(hash)
      if !(hashes["get_emoticon"].keys.include?(emoticon))
        "Sorry, that emoticon was not found"
          else hashes["get_emoticon"].select do |k,v| 
            if k == emoticon 
              answer = v 
                return answer
      end 
    end
  end 
end

def get_english_meaning(hash, emoticon) 
    answer = ""
    hashes = load_library(hash)
      if !(hashes["get_meaning"].keys.include?(emoticon))
        "Sorry, that emoticon was not found"
          else hashes["get_meaning"].select do |k,v| 
            if k == emoticon 
              answer = v 
                return answer
      end
    end 
  end
end