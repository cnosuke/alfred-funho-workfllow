require './lib/funho'

KINDS = {
  t: :tweet,
  i: :interrupt,
  k: :keep,
  o: :other
}
DEFAULT_KIND = :t

arg = ARGV.first.strip
args = arg.split(/\s+/, 2)

if args.size == 2 && KINDS.keys.include?(args.first.to_sym)
  kind_key, comment = *args
else
  kind_key, comment = DEFAULT_KIND, arg
end

kind = KINDS[kind_key.to_sym]

Funho.x(kind: kind, comment: comment)
