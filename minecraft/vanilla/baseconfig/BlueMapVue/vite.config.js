import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue2';

// https://vitejs.dev/config/
export default defineConfig({
  base: '/map/',
  server: {
    proxy: {
      '/settings.json': {
        //target: 'http://localhost:8100',
        target: 'https://map-data.play.ranol.tk/test',
        changeOrigin: true,
      },
      '/maps': {
        //target: 'http://localhost:8100',
        target: 'https://map-data.play.ranol.tk',
        changeOrigin: true,
      },
      '/assets/playerheads': {
        //target: 'http://localhost:8100',
        target: 'https://map-data.play.ranol.tk',
        changeOrigin: true,
      },
    },
  },
  plugins: [vue()],
});
