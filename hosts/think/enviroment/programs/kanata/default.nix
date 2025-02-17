{
  services.kanata = {
    enable = true;
    keyboards = {
      thinkpad = {
        devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
        config = ''
          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv  1    2    3    4    5    6    7    8    9    0    -    =   bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]   \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft pgdn pgup
            lctl lmet lalt           spc            ralt rmet cmp  rctl
          )

          (defvar
            tap-timeout 000
            hold-timeout 200

            tt $tap-timeout
            ht $hold-timeout
          )

          (deftemplate double-tap-layer-switch (key layer-name)
            $key (tap-dance 200 (
              (macro $key $key)
              (layer-switch $layer-name)
            ))
          )

          (deflayermap (default)
            (template-expand double-tap-layer-switch ralt transparent)
            lalt (tap-hold $tt $ht lalt (layer-while-held extended))
          )

          (deflayermap (transparent)

            q (tap-hold-release $tt $ht q 1)
            w (tap-hold-release $tt $ht w 2)
            e (tap-hold-release $tt $ht e 3)
            r (tap-hold-release $tt $ht r 4)
            t (tap-hold-release $tt $ht t 5)
            y (tap-hold-release $tt $ht y 6)
            u (tap-hold-release $tt $ht u 7)
            i (tap-hold-release $tt $ht i 8) 
            o (tap-hold-release $tt $ht o 9) 
            p (tap-hold-release $tt $ht p 0) 

            lalt (tap-hold $tt $ht lalt (layer-while-held extended))
            (template-expand double-tap-layer-switch ralt default)
          )

          (deflayermap (extended)
            h left
            j down
            k up
            l rght

            u pgup
            d pgdn
            b C-left
            e C-rght

            y C-c
            p C-v 
            v C-a
          )
        '';
      };
    };
  };
}
