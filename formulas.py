import pylab as plt
import seaborn as sns

class FirstData :

    def first_view(df): 
        print('Dimensiones de df')
        print(df.shape)
        print()
        print('Info')
        display(df.info())
        print()
        print('Descripcion')
        display(df.describe())
        

        print('View of Nulls')
        
        plt.figure(figsize=(10, 6)) 
        sns.heatmap(df.isna(),
        yticklabels=False,
        cmap='viridis',
        cbar=False)


        print()
        print("Let's lower the cases in columns names.")
        df.columns= df.columns.str.lower()
        
        print()
        print("Let's lower the cases in all the data.")
        df = df.apply(lambda x: x.astype(str).str.lower())

        print()
        print('Are their duplicates ?',df.duplicated().sum())

        print(df.head(10))
        return df
        