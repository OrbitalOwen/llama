return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local lib = ReplicatedStorage.lib
	local Llama = require(lib.Llama)

	local Set = Llama.Set
	local has = Set.has

	it("should return a boolean", function()
		local a = {}

		expect(has(a, "e")).to.be.a("boolean")
	end)

	it("should return whether table has key or not", function()
		local a = {
			foo = true,
			bar = true,
			baz = true,
		}

		expect(has(a, "foo")).equal(true)
		expect(has(a, "yeet")).equal(false)
	end)
end