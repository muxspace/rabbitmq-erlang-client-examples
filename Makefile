REBAR:=rebar

.PHONY: all erl test clean doc run

all: erl

erl:
	$(REBAR) get-deps compile

run:
	ERL_LIBS=deps erl -sname stocks_example -pa ebin -run stocks_example

test: all
	@mkdir -p .eunit
	$(REBAR) skip_deps=true eunit

clean:
	$(REBAR) clean
	-rm -rvf deps ebin doc .eunit

doc:
	$(REBAR) doc
