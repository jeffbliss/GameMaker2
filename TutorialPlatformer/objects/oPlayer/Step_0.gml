if mouse_check_button_pressed(mb_right) {
  if window_get_fullscreen() {
    window_set_fullscreen(false);
  } else {
    window_set_fullscreen(true);
  }
}

// Get player input 
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp += grv

if(place_meeting(x,y+1,oWall)) && (key_jump) {
  audio_play_sound(soundJump,2,false);
  vsp = -8;
}

// Horizontal Collision  
if (place_meeting(x+hsp,y,oWall)) {
  while (!place_meeting(x+sign(hsp),y,oWall)) {
    x = x + sign(hsp);
  }
  hsp = 0;
}
x = x + hsp;

// Vertical Collision  
if (place_meeting(x,y+vsp,oWall)) {
  while (!place_meeting(x,y+sign(vsp),oWall)) {
    y += sign(vsp);
  }
  vsp = 0;
}
y += vsp;

// Animation
if (!place_meeting(x,y+1,oWall)) {
  sprite_index = sPlayerAir;
  image_speed = 0;
  if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
  image_speed = 1;
  if (hsp == 0) {
    sprite_index = sPlayer;
  } else {
    sprite_index = sPlayerRunning;
  }
}

if (hsp != 0) image_xscale = sign(hsp); 