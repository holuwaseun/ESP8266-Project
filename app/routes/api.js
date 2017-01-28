const jsonwebtoken = require("jsonwebtoken")

let secret_key = `ESP8266-PROJECT`;

function createToken(user)
{
    let token = jsonwebtoken.sign(user, secret_key, {
        expiresIn: 86400
    })

    return token
}

module.exports = (app, express, io) => {
    let api = express.Router()

    /*
    // Auth end point of the API
    // Handles authentiation of
    // devices and creation of
    // tokens for sessions
    */
    api.post("/device/connect", (request, response) => {
        let device = {
            device_name: request.body.device_name,
            device_key: request.body.device_key
        }
        if(!device.device_key || device.device_key !== 'MInc Systems')
        {
            response.status(200).send({
                status: 403,
                success: false,
                message: `Connect Failed`
            })
            return false
        }
        else
        {
            let token = createToken(device)
            response.status(200).json({
                status: 200,
                success: true,
                message: "Device Online",
                token: token
            })
        }
    })
    
    //middleware to confirm device logged in state
    api.use((request, response, next) => {
        let token = request.body.token || request.query.token || request.headers['x-access-token']

        if(!token)
        {
            response.status(200).send({
                status: 403,
                success: false,
                message: "Device Rejected"
            })
            return false
        }
        else
        {
            jsonwebtoken.verify(token, secret_key, (err, device) => {
                if(err)
                {
                    response.status(200).send({
                        status: 403,
                        success: false,
                        message: "Invalid Token"
                    });
                    return false
                }
                request.device = device
                next()
            })
        }
    })

    api.get("/fruits", (request, response) => {
        let fruits = [
            {
                name: `Apple`,
                left: 10
            },
            {
                name: `Mango`,
                left: 6
            }
        ]

        response.status(200).json({
            status: 200,
            success: true,
            message: "Fruits Loaded",
            fruits: fruits
        })
    })
    
    api.get("/device", (request,response) => {
        response.status(200).json({
            status: 200,
            success: true,
            message: "Device Loaded",
            device: request.device
        })
    })

    return api
}