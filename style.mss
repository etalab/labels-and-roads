/* ******* */
/* Palette */
/* ******* */
@land:              #fefefd;
@admin:             #c7a28a;

@city_text:         #222;
@city_halo:         @land;
@town_text:         #444;
@town_halo:         @land;
@village_text:      #444;
@village_halo:      @land;

@sans:              'Fira Sans Regular','DejaVu Sans Book','Unifont Medium';
@sans_bold:         'Fira Sans Bold','Unifont Medium';
@sans_bold_italic:  'Fira Sans Bold Italic','Unifont Medium';
@sans_light:        'Fira Sans Light','Unifont Medium';
@sans_book:         'Fira Sans Book','Unifont Medium';

Map {
  buffer-size: 256;
  font-directory: url('fonts');
}

#roads.geo[kind='minor_road'][zoom>=16]::surface,
#roads.geo[highway='trunk'][zoom>=12]::surface,
#roads.geo[highway='trunk_link'][zoom>=12]::surface,
#roads.geo[highway='motorway'][zoom>=12]::surface,
#roads.geo[highway='motorway_link'][zoom>=12]::surface,
#roads.geo[highway='primary'][zoom>=13]::surface,
#roads.geo[kind='major_road'][zoom>=14]::surface {
    line-color: white;
    line-width: 2;
    opacity: 0.3;
    line-cap: square;
    [zoom>=15] {line-width: 3;}
    [zoom>=17] {line-width: 6;}
}
#roads.label[kind='minor_road'][zoom>=17],
#roads.label[kind='major_road'][zoom>=14] {
  text-name: '[name]';
  text-size: 12;
  text-face-name: @sans_bold_italic;
  text-halo-radius: 1;
  text-fill: @city_text;
  text-halo-fill: @city_halo;
  text-placement: line;
  text-repeat-distance: 150;
  text-margin: 5;
  text-min-padding: 1;
}
