function get_button_id(button)
  return ({
    ["❎"] = 4,
    ["🅾️"] = 5,
    ["⬅️"] = 0,
    ["⬇️"] = 3,
    ["➡️"] = 1
  })[button]
end

function get_pitch_id(pitch)
  return ({
    ["C0"] = 0,
    ["C#0"] = 1,
    ["D0"] = 2,
    ["D#0"] = 3,
    ["E0"] = 4,
    ["F0"] = 5,
    ["F#0"] = 6,
    ["G0"] = 7,
    ["G#0"] = 8,
    ["A0"] = 9,
    ["A#0"] = 10,
    ["B0"] = 11,
    ["C1"] = 12,
    ["C#1"] = 13,
    ["D1"] = 14,
    ["D#1"] = 15,
    ["E1"] = 16,
    ["F1"] = 17,
    ["F#1"] = 18,
    ["G1"] = 19,
    ["G#1"] = 20,
    ["A1"] = 21,
    ["A#1"] = 22,
    ["B1"] = 23,
    ["C2"] = 24,
    ["C#2"] = 25,
    ["D2"] = 26,
    ["D#2"] = 27,
    ["E2"] = 28,
    ["F2"] = 29,
    ["F#2"] = 30,
    ["G2"] = 31,
    ["G#2"] = 32,
    ["A2"] = 33,
    ["A#2"] = 34,
    ["B2"] = 35,
    ["C3"] = 36,
    ["C#3"] = 37,
    ["D3"] = 38,
    ["D#3"] = 39,
    ["E3"] = 40,
    ["F3"] = 41,
    ["F#3"] = 42,
    ["G3"] = 43,
    ["G#3"] = 44,
    ["A3"] = 45,
    ["A#3"] = 46,
    ["B3"] = 47,
    ["C4"] = 48,
    ["C#4"] = 49,
    ["D4"] = 50,
    ["D#4"] = 51,
    ["E4"] = 52,
    ["F4"] = 53,
    ["F#4"] = 54,
    ["G4"] = 55,
    ["G#4"] = 56,
    ["A4"] = 57,
    ["A#4"] = 58,
    ["B4"] = 59,
    ["C5"] = 60,
    ["C#5"] = 61,
    ["D5"] = 62,
    ["D#5"] = 63
  })[pitch]
end

function get_song_data(song_name)
  local song = ({
    canon_rock = {
      bpm = 64,
      raw_tracks = {
        "B1,0,5,0,1/2+B1,0,5,0,1/2|B1,0,5,0,1/2+B1,0,5,0,1/2",
        "B1,0,5,0,1/2+B1,0,5,0,1/2|B1,0,5,0,1/2+B1,0,5,0,1/2"
      }
    }
  })[song_name]

  song.tracks = {}

  for track in all(song.raw_tracks) do
    local parsed_chords = {}
    local chords = split(track, "|")

    for c = 1, #chords do
      local parsed_chord = {}
      local notes = split(chords[c], "+")

      for n = 1, #notes do
        add(parsed_chord, split(notes[n]))
      end

      add(parsed_chords, parsed_chord)
    end

    add(song.tracks, parsed_chords)
  end

  return song
end