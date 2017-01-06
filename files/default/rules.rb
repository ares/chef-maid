Maid.rules do
  # setup paths
  rule 'Setup paths' do
    mkdir('~/Downloads/filmy')
  end

  rule 'Move films' do
    %w(AVI MPG MPEG MKV M4V MP4 avi mpg mpeg mkv m4v mp4).each do |suffix|
      dir("~/Downloads/*.#{suffix}").each { |path| move(path, '~/Downloads/filmy') }
    end
  end

  delete_1_week_unaccessed_file = lambda { |path| remove(path) if 1.week.ago > accessed_at(path) }

  for ext in %w(zip exe deb iso srt sub rar pdf crdownload odt doc)
    rule "Remove mess with extension .#{ext}" do
      dir("~/Downloads/*.#{ext}").each &delete_1_week_unaccessed_file
    end
  end

  rule "Remove all torrents" do
    dir("~/Downloads/*.torrent").each { |path| remove(path) if 10.minutes.ago > accessed_at(path) }
  end

  rule "Delete one day old jnlp files" do
    dir("~/Downloads/*.jnlp").each { |path| remove(path) if 1.day.ago > accessed_at(path) }
  end

end
