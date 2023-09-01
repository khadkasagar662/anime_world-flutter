const express = require('express');
const axios = require('axios');

const router = express.Router();

// Define a route to fetch anime data from the Jikan API
router.get('/anime', async (req, res) => {
  try {
    const animeId = req.params.id;
    const jikanResponse = await axios.get(`https://api.jikan.moe/v4/anime/`);
    const animeData = jikanResponse.data;
    res.json(animeData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch anime data from Jikan API' });
  }
});
router.get('/anime/:id', async (req, res) => {
  try {
    const animeId = req.params.id;
    const jikanResponse = await axios.get(`https://api.jikan.moe/v4/anime/${animeId}`);
    const animeData = jikanResponse.data;
    res.json(animeData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch anime data from Jikan API' });
  }
});

// Define a route to fetch anime characters data from the Jikan API
router.get('/anime/:id/characters', async (req, res) => {
    try {
      const animeId = req.params.id;
      const jikanResponse = await axios.get(`https://api.jikan.moe/v4/anime/${animeId}/characters`);
      const charactersData = jikanResponse.data;
      res.json(charactersData);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to fetch anime characters data from Jikan API' });
    }
  });
  
  // Define a route to fetch anime statistics data from the Jikan API
  router.get('/anime/:id/statistics', async (req, res) => {
    try {
      const animeId = req.params.id;
      const jikanResponse = await axios.get(`https://api.jikan.moe/v4/anime/${animeId}/statistics`);
      const statisticsData = jikanResponse.data;
      res.json(statisticsData);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to fetch anime statistics data from Jikan API' });
    }
  });
  
  // Define a route to fetch anime recommendations data from the Jikan API
  router.get('/anime/:id/recommendations', async (req, res) => {
    try {
      const animeId = req.params.id;
      const jikanResponse = await axios.get(`https://api.jikan.moe/v4/anime/${animeId}/recommendations`);
      const recommendationsData = jikanResponse.data;
      res.json(recommendationsData);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to fetch anime recommendations data from Jikan API' });
    }
  });
  

module.exports = router;
