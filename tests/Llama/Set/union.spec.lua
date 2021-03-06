return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local lib = ReplicatedStorage.lib
	local Llama = require(lib.Llama)

	local Set = Llama.Set
	local union = Set.union

	it("should return a new table", function()
		local a = {}

		expect(union(a)).never.to.equal(a)
	end)
	
	it("should not mutate the given table(s)", function()
		local a = {
			foo = true,
			bar = true,
			baz = true,
		}
		local b = {
			foobar = true,
			barbaz = true,
			bazfoo = true,
		}
		local mutationsA = 0
		local mutationsB = 0

		setmetatable(a, {
			__newindex = function()
				mutationsA = mutationsA + 1
			end
		})

		setmetatable(b, {
			__newindex = function()
				mutationsB = mutationsB + 1
			end
		})

		union(a, b)

		expect(mutationsA).to.equal(0)
		expect(mutationsB).to.equal(0)
	end)

	it("should return the union between provided sets", function()
		local a = {
			foo = true,
		}
		local b = {
			bar = true,
		}
		local c = {
			baz = true,
		}

		local together = union(a, b, c)
		
		expect(together.foo).to.equal(true)
		expect(together.bar).to.equal(true)
		expect(together.baz).to.equal(true)
	end)
end