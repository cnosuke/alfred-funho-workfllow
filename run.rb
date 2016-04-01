require './lib/funho'

KINDS = {
  t: :tweet,
  i: :interrupt,
  k: :keep,
  o: :other
}
DEFAULT_KIND = :t

args = ARGV.first.split(/\s/)

if args.size == 2
  kind_key, comment = *args
elsif args.size == 1
  kind_key, comment = DEFAULT_KIND, args.first
end

kind = KINDS[kind_key.to_sym]

Funho.x(kind: kind, comment: comment)
