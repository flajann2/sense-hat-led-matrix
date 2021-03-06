module SenseHatAPI
  WHITE = [255, 255, 255]
  BLACK = [0, 0, 0]

  SH_ROWS = 8 #y := {0 .. 7}
  SH_COLS = 8 #x := {0 .. 7}
  SH_BITS_R = 5
  SH_BITS_G = 6
  SH_BITS_B = 5
  
  class SenseHat
    def initialize(framebuffer: '/dev/fb1', back_colour: BLACK)
      @framebuffer = framebuffer
      
      # since we wish to address as [x, y], x must address a vector of y pixels
      ypixels = (back_colour * SH_ROWS).each_slice(back_colour.length).to_a
      @canvas = (ypixels * SH_COLS).each_slice(SH_ROWS).to_a
    end
    
    def set_rotation(r, redraw = true)
    end
    alias_method :rotation=, :set_rotation

    def  flip_h(redraw=true)
    end
    
    def  flip_v(redraw=true)
    end

    def set_pixels(pixel_list)
    end
    alias_method :pixels=, :set_pixels

    def get_pixels
    end
    alias_method :pixels, :get_pixels

    def set_pixel(x, y, *rgb)
      rgb = rgb.first if rgb.first.is_a? Array
    end

    def get_pixel(x, y)
    end

    def load_image(file_path, redraw=true)
    end

    def clear(*rgb)
      rgb = BLACK if rgb.empty?
      rgb = rgb.first if rgb.first.is_a? Array
    end

    def show_message(text_string, scroll_speed=0.1, text_colour=WHITE, back_colour=BLACK)
    end

    def show_letter(s, text_colour=WHITE, back_colour=BLACK)
    end

    def low_light=(b)
    end

    def gamma=(g)
    end

    def gamma_reset
    end

    private
    # Flush the canvas to the LED matrix
    def flush
      seq = @canvas
            .flatten(1)
            .map{ |r,g,b| (((r & 0xff) >> 3) << 11) + (((g & 0xff) >> 2) << 5) + ((b & 0xff) >> 3)  }
      open(@framebuffer, 'rb+') do |fb|
        fb.write seq.pack('S<' * seq.length)
      end      
    end
  end
end
