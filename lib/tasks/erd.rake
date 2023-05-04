desc 'Generate Entity Relationship Diagram'
task :generate_erd do
  system "erd --inheritance --filetype=dot --direct --attributes=foreign_keys,content"
  system "erd.png"
end