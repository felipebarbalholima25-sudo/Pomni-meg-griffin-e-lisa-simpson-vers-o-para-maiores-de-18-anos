import React, { useState, useMemo } from 'react';
import { Search, Trophy, Globe, Users, Zap, Film, Music, Gamepad2, Building, Car } from 'lucide-react';

const RecordesMundiais = () => {
  const [busca, setBusca] = useState('');
  const [categoriaAtiva, setCategoriaAtiva] = useState('todos');

  const recordes = [
    {
      id: 1,
      categoria: 'anatomia',
      titulo: 'Homem Mais Alto',
      detentor: 'Robert Wadlow',
      pais: 'Estados Unidos',
      valor: '2,74 m',
      ano: 1940,
      icone: Users
    },
    {
      id: 2,
      categoria: 'anatomia',
      titulo: 'Homem Mais Alto Atualmente',
      detentor: 'Sultan Köse