async = require('async')
exec = require('child_process').exec
#iptables = require('netfilter').iptables

iptables = {}

iptables.append = (rule, cb) ->
	exec("iptables -t #{rule.table} -A #{rule.rule}", cb)

iptables.delete = (rule, cb) ->
	exec("iptables -t #{rule.table} -D #{rule.rule}", cb)

iptables.appendMany = (rules, cb) ->
	async.eachSeries rules, iptables.append, cb

iptables.deleteMany = (rules, cb) ->
	async.eachSeries rules, iptables.delete, cb

module.exports = iptables
