import { Hono } from 'hono'
import { adminRouter } from './routes/admin';
import { doctorRouter } from './routes/doctor';
import { patientRouter } from './routes/patient';
const app = new Hono()

app.route('/api/v1/admin', adminRouter);
app.route('/api/v1/doctor', doctorRouter);
app.route('/api/v1/patient', patientRouter);
app.get('/', (c) => {
  return c.text('Hello Hono!')
})

export default app
