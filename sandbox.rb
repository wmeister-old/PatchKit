# ideas

patcher = PatchKit::Patcher.new

patcher.with 'foo.exe' do |file|
  on :x86 do
    puts "Patching #{file.name}.."

    at 0x004f15af do
      nop
      nop
      jmp 0x004f152f
    end

    # or..

    0x004f16af = nop,
                 nop,
                 jmp 0x004f152f 
  end
end
