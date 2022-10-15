import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue2';

// https://vitejs.dev/config/
export default defineConfig({
  base: '/map/',
  server: {
    proxy: {
      '/settings.json': {
        //target: 'http://localhost:8100',
        target: 'https://play.ranol.tk/map-data',
        changeOrigin: true,
      },
      '/maps': {
        //target: 'http://localhost:8100',
        target: 'https://play.ranol.tk/map-data',
        changeOrigin: true,
      },
      '/assets/playerheads': {
        //target: 'http://localhost:8100',
        target: 'https://play.ranol.tk/map-data',
        changeOrigin: true,
      },
    },
  },
  plugins: [vue()],
});
