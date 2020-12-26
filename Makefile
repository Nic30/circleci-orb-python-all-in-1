docs-index:
	cat README.md \
	| sed -E 's/\[(.*)\]\(([^\/]*\.md)\)/[\1](https:\/\/github.com\/Nic30\/circleci-orb-python-all-in-1\/tree\/master\/\2)/g' \
	| sed -E 's/src="\/docs\/(.*)"/src="\1"/g' \
	| sed -E 's/\[(.*)\]\(\/*docs\/(.*)\)/[\1](\2)/g' \
	| sed -E 's/\[(.*)\]\((\/.*)\)/[\1](https:\/\/github.com\/Nic30\/circleci-orb-python-all-in-1\/tree\/master\2)/g' \
	> docs/index.md
orb-validate:
	circleci config pack src/ > orb.yml
	circleci orb validate orb.yml
