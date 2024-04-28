import { Hono } from 'hono'
import { adminRouter } from './routes/admin';
import { doctorRouter } from './routes/doctor';
import { patientRouter } from './routes/patient';
import { hospitalRouter } from './routes/hospital';
export const app = new Hono<{
  Bindings: {
      DATABASE_URL: string;

  }
}>();

app.route('/api/v1/admin', adminRouter);
app.route('/api/v1/doctor', doctorRouter);
app.route('/api/v1/patient', patientRouter);
app.route('/api/v1/hospital/', hospitalRouter);
app.get('/', (c) => {
  return c.text('Hello Hono!')
})

export default app
