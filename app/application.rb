require 'pry'
class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            name = req.path.split("/items/").last
            my_item = @@items.find {|i| i.name == name }
            if my_item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write my_item.price
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end