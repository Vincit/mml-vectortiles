// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Fonts
@sans: 'Source Sans Pro Regular';
@sans_italic: 'Source Sans Pro Italic';
@sans_bold: 'Source Sans Pro Bold';
@sans_semi_bold: 'Source Sans Pro Semibold';

Map {
  font-directory: url("fonts/");
  background-color: #fff;
  buffer-size: 1024;
}

#KarttanimiPiste {
  text-name:"''";
  text-face-name: @sans_semi_bold;
  text-fill: #000000;
  text-character-spacing: -2;
  //text-orientation: [kallistus];
  //text-wrap-width: 150;
  //text-wrap-before: true;
  text-halo-fill: #fff;
  text-halo-radius: 0.5;
  text-halo-rasterizer: fast;
  text-min-distance: 5;
  text-placement-type: simple;
  text-placements: "E";

  [paikkaXP > 1][knimiXP > 1] {
    //text-dx: [paikkaXP] - [knimiXP];
    //text-dy: [knimiYI] - [paikkaYI];
  }

  [kirjVari = 55] {
    // (C100M70Y0K0
    text-fill: rgb(0,70,255);
    text-halo-fill: #fff;
    text-face-name: @sans;
  }
  
  [kirjTyyppi = 10] {
    text-face-name: @sans;
  }

  [kirjTyyppi = 20] {
    text-face-name: @sans_bold;
  }

  [zoom = 10][paikkaTyyp >= 540][paikkaTyyp <= 560] {
      text-name: "[knimiTekst]";
      text-size: '5*[kirjKoko]/100';    
  }

  [zoom = 11][paikkaTyyp >= 540][paikkaTyyp <= 560] {
      text-name: "[knimiTekst]";
      text-size: '6*[kirjKoko]/100';    
  }
  
  [zoom = 12] {
      text-name: "[knimiTekst]";
      text-size: '8*[kirjKoko]/100';    
  }
  
  [zoom >= 13] {
      text-name: "[knimiTekst]";
      text-size: '11*[kirjKoko]/100';    
  }  
}

#AmpumaRaja {
  line-width: 1;
  line-color: rgba(204,136,68,0.5);
}

#HallintoAlue {
  //line-width: 3;
  //line-color: #4D00FF;
  //line-dasharray: 20,5,5;
}

#HallintoalueRaja {
  line-cap: round;

  // Aluemeren ulkoraja
  [Kohdeluokk = 82100] {
    line-width: 3;
    line-color: #4D00FF;
    line-dasharray: 20,15;
    line-join: miter;
  }

  // Valtakunnan raja
  [Kohdeluokk = 84111] {
  }
  
  //  Aluehallintoviraston raja
  [Kohdeluokk = 84112] {
  }
  
  // Aluehallintoviraston raja 
  [Kohdeluokk = 84112] {
  }
  
  //  Kunnan raja
  [Kohdeluokk = 84113][zoom < 12]  {
    line-width: 2;
    line-color: #4D00FF;
    line-dasharray: 20,3,3,3;
  }

  [Kohdeluokk = 84113][zoom >= 12]  {
    line-width: 2;
    line-color: #4D00FF;
    line-dasharray: 10,2,2,3,2,3;
  }
  
  // Maakunnan raja
  [Kohdeluokk = 84115] {
  }
}

#KaasuJohto {
  line-width: 1;
  line-color: cyan;
}

#KiitotieViiva {
  line-color: red;

  [zoom > 14] {
    line-width: 10;
  }
  [zoom = 14] {
    line-width: 7;
  }
  [zoom = 13] {
    line-width: 3;
  }
  [zoom = 12] {
    line-width: 3;
  }
}

#KorkeusViiva {
  line-width: 1;
  line-color: #A64D00;
  
  [zoom >= 15] {
    line-width: 2;
    line-color: #BD7D39;
  }
}

#KoskiPiste {
  line-width: 1;
  line-color: rgba(255,119,85,0.5);
}

#KoskiViiva {
  line-width: 1;
  line-color: rgba(255,170,238,0.5);
}

#LiikenneAlue {
  line-width: 1;
  
  // Autoliikennealue
  [Kohdeluokk = 32421] {    
    polygon-fill: #FFB280
  }

  // Lentoasema
  [Kohdeluokk = 32441] {
     polygon-fill: #FFFF8C; 
  }
  
  // Lentokenttä
  [Kohdeluokk = 32442] {
    polygon-fill: #FFFF8C; 
  }
}

#MaaAlue {
  line-width: 1;
  polygon-fill: red;

  // Karkea kivennäismaa ottoalue
  [Kohdeluokk = 32111] {
    line-width: 2;
    line-color: #000;
    polygon-fill: #FEFED8;
  }

  // Hienon kivennäismaa ottoalue
  [Kohdeluokk = 32112] {
    line-color: rgb(0,0,0,0);
    polygon-fill: #D1CC40;
  }

  // Eloperäinen ottoalue
  [Kohdeluokk = 32113] {
    line-color: rgb(0,0,0,0);
    polygon-fill: #D1CC40;
  }

  // Hautausmaa
  [Kohdeluokk = 32200] {
    polygon-fill: #80FF80;
  }
  
  // Kaatopaikka
  [Kohdeluokk = 32300] {
    line-width: 1;
    polygon-fill: #FFFFD9;
  }

  // Louhos
  [Kohdeluokk = 32500] {
    line-width: 1;
    polygon-fill: #FFFFD9;
  }

  // Puisto
  [Kohdeluokk = 32900] {
    line-width: 1;
    polygon-fill: #B3FF66;
  }

  // Täytemaa
  [Kohdeluokk = 33000] {
    line-width: 1;
    polygon-fill: #FFFFD9;
  }

  // Urheilu- tai virkistysalue
  [Kohdeluokk = 33100] {
    line-width: 1;
    polygon-fill: #E6FF80;
  }

  // Kallio
  [Kohdeluokk = 34100] {
    line-width: 0;
    polygon-fill: #D1C7D1;
  }

  // Hietikko
  [Kohdeluokk = 34300] {
    line-width: 1;
    polygon-fill: #FFFF66;
  }

  // Kivikko
  [Kohdeluokk = 34700] {
    line-width: 1;
    polygon-fill: #FFFF66;
  }
  
  // Helppo puuton suo
  [Kohdeluokk = 35411] {
    line-width: 1;
    polygon-fill: #D1CC40;
  }

  // Helppo metsäinen suo
  [Kohdeluokk = 35412] {
    line-width: 0;
    polygon-fill: #C7EBEB;
  }
  
  // Vaikea puuton suo
  [Kohdeluokk = 35421] {
    line-width: 0;
    polygon-pattern-file: url('img/stripe1.png');
    polygon-pattern-alignment: local;
  }

  // Vaikea metsäinen suo
  [Kohdeluokk = 35422] {
    line-width: 1;
    polygon-fill: #C7EBEB;
    polygon-pattern-file: url('img/stripe1.png');
    polygon-pattern-alignment: local;
  }
}

#Maasto1Reuna {
  line-width: 1;
  line-color: #AB5600;
}

#Maasto2Alue {
  line-width: 1;
  line-color: #999999;
  polygon-fill: #E6E6E6;
}

#Maasto1Viiva {
  line-width: 2;
  line-color: #AB5600;
}

#MajakkaPiste {
  line-width: 1;
  line-color: rgba(85,85,255,0.5);
}

#MetsaRaja {
  line-width: 2;
  line-color: rgba(68,170,68,0.5);
}

#PeltoAlue {
  line-width: 1;
  
  // Pelto
  [Kohdeluokk = 32611] {
  polygon-fill: #FFD980;
  }
  
  // Puutarha
  [Kohdeluokk = 32612] {
    polygon-fill: #FFD980;
    polygon-pattern-file: url('img/trees-z.png');
    polygon-pattern-alignment: local;
  }
  
  // Niitty
  [Kohdeluokk = 32800] {
    polygon-fill: #FFF266;
  }
}

#PorttiPiste {
  line-width: 1;
  line-color: rgba(119,102,68,0.5);
}

#RajavyohykeRaja {
  line-width: 1;
  line-color: rgba(255,153,136,0.5);
}

#RakennusAlue {
  line-width: 2;
  line-color: #000;
  polygon-fill: red;
  
  // Asuinrakennus
  [Kohdeluokk = 42213] {
    polygon-fill: #CC00CC;
  }
  
  // Liike- tai julkinen rakennus
  [Kohdeluokk = 42223] {
    //polygon-fill: #CC00CC;
    building-fill: #CC00CC;
  }
  
  // Lomarakennus
  [Kohdeluokk = 42233] {
    //polygon-fill: #CC00CC;
    polygon-fill: red;
  }
  
  // Teollinen rakennus
  [Kohdeluokk = 42243] {
    polygon-fill: #CC00CC
  }
  
  // Kirkollinen rakennus
  [Kohdeluokk = 42253] {
    polygon-fill: #CC00CC;
  }
  
  // Kirkko
  [Kohdeluokk = 42270] {
    polygon-fill: #CC00CC;
  }
  
  // Muu rakennus
  [Kohdeluokk = 42263] {
    polygon-fill: #CCCCCC;
  }
}

#RakennusPiste [zoom >= 13] {
  marker-fill: red;
  marker-opacity: 0.9;
  marker-allow-overlap: true;
  marker-placement: point;
  marker-type: ellipse;
  marker-width: 7;
  marker-line-width: 1;
  marker-line-color: #fff;
  marker-line-opacity: 0.9;
  
  // Asuinrakennus
  [Kohdeluokk = 42213] {
    marker-fill: #00B300;
  }
  
  // Liike- tai julkinen rakennus
  [Kohdeluokk = 42223] {
    marker-fill: #00B300;
  }
  
  // Lomarakennus
  [Kohdeluokk = 42233] {
    marker-fill: #00B300;
  }
  
  // Teollinen rakennus
  [Kohdeluokk = 42243] {
    marker-fill: black
  }
  
  // Kirkollinen rakennus
  [Kohdeluokk = 42253] {
    marker-fill: #00B300;
  }
  
  // Kirkko
  [Kohdeluokk = 42270] {
    marker-fill: #00B300;
  }
  
  // Muu rakennus
  [Kohdeluokk = 42264] {
    marker-fill: #000;
  }

  // Masto
  [Kohdeluokk = 44800] {
    marker-fill: #000;
  }
  
  // Savupiippu
  [Kohdeluokk = 45300] {
    marker-fill: #fff;
    marker-line-color: #000;
    marker-line-width: 1;
  }
  
  // Vesitorni
  [Kohdeluokk = 45800] {
    marker-fill: #000;
    marker-width: 11;
  }
  
  // Tuulivoimala
  [Kohdeluokk = 45500] {
    marker-fill: #00B300;
  }
}

#RautatieViiva {
  [zoom <= 13] {
    line-width: 3;
    line-color: #333;
  }
  
  [zoom > 13] {
    ::line {
      line-width: 5;
      line-color: #333;
    }
    ::dash {
      line-color: #99E0FF;
      line-width: 2.5;
      line-dasharray: 6,6;
    }
  }
}

#SahkoLinja {
  line-width: 2;
  line-color: #000;
}

#SuojaAlue {
  line-width: 2;
  line-color: #000;
  polygon-fill: rgba(68, 255, 90, 0.5);
}

#SuojametsaRaja {
  line-width: 20;
  line-color: rgba(68, 255, 90, 0.5);  
}

#SuojeluAlue {
  ::inset {
    line-width: 8;
    line-dasharray: 2, 4;
    line-color: #05B405;
    
    [zoom <= 13] {
      line-width: 6;
      line-dasharray: 1, 2;
      line-color: #32C232;
    }
  }
  
  ::outline {
    line-width: 3;
    line-offset: 4;
    line-color: #05B405;
    line-cap: round;
    line-join: miter;

    [zoom <= 13] {
      line-width: 2;
      line-offset: 3;
    }
  }
}

#TaajamaAlue {
  line-width: 1;

  [zoom < 13] {
    polygon-fill: #F2CEF2;
  }
  
  [zoom = 13] {
    polygon-fill: #F2DAF2;
  }
}

#TiePiste {
  text-name:"''";
  text-face-name: @sans_bold;
  text-fill: #000;
  text-halo-fill: #fff;
  text-halo-radius: 1.0;
  text-halo-rasterizer: fast;
  
  [zoom >= 13] {
    //text-name: "[Kohdeluokk]";    
    //text-size: '15';
  }
}

#TieViiva {
  line-color: #C70000;
  line-width: 0;
  line-cap: round;
  line-join: miter;

  // Moottoritie
  [Kohdeluokk = 12111] {
    [zoom >= 14] {
      line-width: 6;      
    }

    [zoom < 14] {
      ::case {
        line-width: 6;
        line-color: #333;
      }    
      ::fill {
        line-width: 4;      
        line-color: #C70000;
      }
    }
  }
  
  // Moottoritie 2
  [Kohdeluokk = 12112] {
    line-width: 5;
  }

  // Kantatie
  [Kohdeluokk = 12121][zoom >= 8] {
    line-width: 3;
  }
  
  // Pääväylä
  [Kohdeluokk = 12122][zoom >= 10] {
    line-width: 4;
  }
  
  // Taajamatie
  [Kohdeluokk = 12131][zoom >= 13] {
    line-width: 3;
  }
  
  // Taajamatie 2
  [Kohdeluokk = 12132][zoom >= 13] {
    line-width: 1;
  }
  
  // Hiekkatie
  [Kohdeluokk = 12141][zoom >= 13] {
    line-color: #000;
    line-width: 2;
  }
}

#VesiAlue {
  polygon-fill: #80FEFE;
  polygon-gamma: 0.5;
  line-width: 1;
  line-color: #0080FF;
}

#VesiliikenneViiva {
  line-width: 1;
  line-color: rgb(93, 119, 189);
}

#VesirakennelmaPiste {
  line-width: 1;
  line-color: rgba(218, 20, 210, 0.5);
}

#VesiViiva {
  line-width: 2;
  line-color: #2591FF;
}

#VesirakennelmaViiva {
  line-width: 1;
  line-color: rgba(153,68,136,0.5);
}
