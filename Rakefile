require 'rubygems'

desc "Serve"
task :serve do
  system "bundle exec jekyll serve --watch"
end

# Usage: rake drafts
desc "Build Jekyll site with _drafts posts"
task :drafts do
  system "jekyll build --drafts --limit_posts 10"
end # task :drafts

task :default => :serve