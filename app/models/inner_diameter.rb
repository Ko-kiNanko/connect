class InnerDiameter < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '0.01' },
    { id: 3, name: '0.02' },
    { id: 4, name: '0.03' },
    { id: 5, name: '0.04' },
    { id: 6, name: '0.05' },
    { id: 7, name: '0.06' },
    { id: 8, name: '0.07' },
    { id: 9, name: '0.08' },
    { id: 10, name: '0.09' },
    { id: 11, name: '0.10' },
    { id: 12, name: '0.11' },
    { id: 13, name: '0.12' },
    { id: 14, name: '0.13' },
    { id: 15, name: '0.14' },
    { id: 16, name: '0.15' },
    { id: 17, name: '0.16' },
    { id: 18, name: '0.17' },
    { id: 19, name: '0.18' },
    { id: 20, name: '0.19' },
    { id: 21, name: '0.20' },
    { id: 22, name: '0.21' },
    { id: 23, name: '0.22' },
    { id: 24, name: '0.23' },
    { id: 25, name: '0.24' },
    { id: 26, name: '0.25' },
    { id: 27, name: '0.26' },
    { id: 28, name: '0.27' },
    { id: 29, name: '0.28' },
    { id: 30, name: '0.29' },
    { id: 31, name: '0.30' },
    { id: 32, name: '0.31' },
    { id: 33, name: '0.32' },
    { id: 34, name: '0.33' },
    { id: 35, name: '0.34' },
    { id: 36, name: '0.35' },
    { id: 37, name: '0.36' },
    { id: 38, name: '0.37' },
    { id: 39, name: '0.38' },
    { id: 40, name: '0.39' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end