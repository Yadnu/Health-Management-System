import { Hono } from "hono";
import { PrismaClient } from '@prisma/client/edge'
import { withAccelerate } from '@prisma/extension-accelerate'



export const adminRouter =  new Hono<{
    Bindings: {
        DATABASE_URL: string;
        JWT_SECRET: string;
    },
    Variables: {
        userId: string
    }
}>();

adminRouter.post('/addspeciality', async (c)=>{
    const prisma = new PrismaClient({
		datasourceUrl: c.env?.DATABASE_URL	,
	}).$extends(withAccelerate());
    const body = await c.req.json();
    const speciality = prisma.speciality.create({
        data:{
            Speciality: body.Speciality
        }
    });
    console.log(" Speciality created ");
    return c.json({
        speciality: speciality
    });
});

adminRouter.post('/createdoctor',async (c) =>{
    const prisma = new PrismaClient({
		datasourceUrl: c.env?.DATABASE_URL	,
	}).$extends(withAccelerate());
    const body = await c.req.json();
    const doctor = await prisma.doctor.create({
        data:{
            Name: body.Name,
            UserType: body.UserType,
            Password: body.Password,
            Speciality: body.Speciality
        }
    });
    console.log("Doctor Created: ", doctor);
    return c.json({
        doctor : doctor.DId
    });
   
});

adminRouter.post('/createsupportstaff', async (c) =>{
    const prisma = new PrismaClient({
		datasourceUrl: c.env?.DATABASE_URL	,
	}).$extends(withAccelerate());
    const body = await c.req.json();
    const supportStaff = await prisma.supportStaff.create({
        data:{
            Name: body.Name,
            Password: body.Password,
            Designation: body.Designation
            
            
        }
    })

})