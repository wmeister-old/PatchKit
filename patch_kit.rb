require 'digest/md5'

module PatchKit
  def md5chksum(file_name)
    File.exists?(file_name) ? Digest::MD5.hexdigest(IO.read(file_name)) : nil
  end

  def hexstr(*args)
    args.collect{ |arg| arg.chr }.join
  end

  def patch(file_name, *patches)
    file = File.new(file_name, 'r+')
    for patch in patches
      offset      = patch[:offset] || patch['offset'] or raise 'Missing offset'
      replacement = patch[:replacement] || patch['replacement'] or raise 'Missing replacement'
      _patch(file, offset, replacement)
    end
    file.close
  end

  def _patch(file, offset, replacement)
    file.seek(offset)
    file.write(replacement)
  end
end
