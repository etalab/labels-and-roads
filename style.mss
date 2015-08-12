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

#roads.geo[type='trunk_link'][zoom>=12]::surface,
#roads.geo[type='motorway_link'][zoom>=12]::surface,
#roads.geo[type='primary_link'][zoom>=13]::surface,
#roads.geo[type='secondary_link'][zoom>=14]::surface,
#roads.geo[type='tertiary_link'][zoom>=14]::surface,
#roads.geo[category='minor_road'][zoom>=16]::surface,
#roads.geo[type='trunk'][zoom>=12]::surface,
#roads.geo[type='motorway'][zoom>=12]::surface,
#roads.geo[type='primary'][zoom>=13]::surface,
#roads.geo[category='path'][name!=''][zoom>=17]::surface,
#roads.geo[type='tertiary'][zoom>=14]::surface,
#roads.geo[type='secondary'][zoom>=14]::surface {
    [type='trunk'],
    [type='motorway'] {
      outline/line-width: 3;
      outline/opacity: 0.5;
      outline/line-color: white;
      [zoom>=15] {outline/line-width: 5;}
      [zoom>=17] {outline/line-width: 8;}
    }
    line-color: white;
    line-width: 2;
    opacity: 0.3;
    line-cap: square;
    [zoom>=15] {line-width: 3;}
    [zoom>=17] {line-width: 6;}
    [type='trunk'],
    [type='motorway'] {
      opacity: 0.5;
      line-color: #F9BF3B;
      [zoom>=16][tunnel=1] {
        line-dasharray: 10,5;
        line-cap: butt;
      }
    }
}
#roads.label[category='minor_road'][zoom>=17],
#roads.label[category='path'][name!=''][zoom>=17],
#roads.label[category='major_road'][zoom>=14] {
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

#housenumbers [zoom>=17][housenumber=~"2|.*[01]$"], // only 1,2,10,11,20,21...
#housenumbers [zoom>=18]
{
  text-name: [housenumber];
  text-size: 10;
  text-face-name: @sans_bold;
  text-halo-radius: 1;
  text-fill: darken(red,20%);
  text-halo-fill: @city_halo;
  text-margin: 1;
  [zoom>=17][name_diff<=2]{
    text-orientation: -[azimuth];
    [azimuth>90][azimuth<270] {
      text-orientation: 180-[azimuth];
    }
  }

  // when not enough space to render housenumber, just render a marker
  marker-width: 4;
  marker-fill: darken(red,20%);
  marker-line-color: white;
  marker-line-width: 0.7;

}
